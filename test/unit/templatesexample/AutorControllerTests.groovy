package templatesexample



import org.junit.*
import grails.test.mixin.*

@TestFor(AutorController)
@Mock(Autor)
class AutorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/autor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.autorInstanceList.size() == 0
        assert model.autorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.autorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.autorInstance != null
        assert view == '/autor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/autor/show/1'
        assert controller.flash.message != null
        assert Autor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/autor/list'

        populateValidParams(params)
        def autor = new Autor(params)

        assert autor.save() != null

        params.id = autor.id

        def model = controller.show()

        assert model.autorInstance == autor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/autor/list'

        populateValidParams(params)
        def autor = new Autor(params)

        assert autor.save() != null

        params.id = autor.id

        def model = controller.edit()

        assert model.autorInstance == autor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/autor/list'

        response.reset()

        populateValidParams(params)
        def autor = new Autor(params)

        assert autor.save() != null

        // test invalid parameters in update
        params.id = autor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/autor/edit"
        assert model.autorInstance != null

        autor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/autor/show/$autor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        autor.clearErrors()

        populateValidParams(params)
        params.id = autor.id
        params.version = -1
        controller.update()

        assert view == "/autor/edit"
        assert model.autorInstance != null
        assert model.autorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/autor/list'

        response.reset()

        populateValidParams(params)
        def autor = new Autor(params)

        assert autor.save() != null
        assert Autor.count() == 1

        params.id = autor.id

        controller.delete()

        assert Autor.count() == 0
        assert Autor.get(autor.id) == null
        assert response.redirectedUrl == '/autor/list'
    }
}
