package templatesexample



import org.junit.*
import grails.test.mixin.*

@TestFor(LibroController)
@Mock(Libro)
class LibroControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/libro/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.libroInstanceList.size() == 0
        assert model.libroInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.libroInstance != null
    }

    void testSave() {
        controller.save()

        assert model.libroInstance != null
        assert view == '/libro/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/libro/show/1'
        assert controller.flash.message != null
        assert Libro.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/libro/list'

        populateValidParams(params)
        def libro = new Libro(params)

        assert libro.save() != null

        params.id = libro.id

        def model = controller.show()

        assert model.libroInstance == libro
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/libro/list'

        populateValidParams(params)
        def libro = new Libro(params)

        assert libro.save() != null

        params.id = libro.id

        def model = controller.edit()

        assert model.libroInstance == libro
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/libro/list'

        response.reset()

        populateValidParams(params)
        def libro = new Libro(params)

        assert libro.save() != null

        // test invalid parameters in update
        params.id = libro.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/libro/edit"
        assert model.libroInstance != null

        libro.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/libro/show/$libro.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        libro.clearErrors()

        populateValidParams(params)
        params.id = libro.id
        params.version = -1
        controller.update()

        assert view == "/libro/edit"
        assert model.libroInstance != null
        assert model.libroInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/libro/list'

        response.reset()

        populateValidParams(params)
        def libro = new Libro(params)

        assert libro.save() != null
        assert Libro.count() == 1

        params.id = libro.id

        controller.delete()

        assert Libro.count() == 0
        assert Libro.get(libro.id) == null
        assert response.redirectedUrl == '/libro/list'
    }
}
